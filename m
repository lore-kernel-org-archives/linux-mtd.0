Date: Wed, 2 Feb 2005 15:44:50 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <1107276561.21196.457.camel@tglx.tec.linutronix.de>
Message-ID: <Pine.LNX.4.58.0502021544380.29798@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
	<1106873065.21196.168.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280817330.11160@phoenix.infradead.org>
	<1106903029.21196.216.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280914580.11160@phoenix.infradead.org>
	<Pine.LNX.4.58.0501281855370.11160@phoenix.infradead.org>
	<1107111514.18794.37.camel@sauron.oktetlabs.ru>
	<6934efce05013108463a4d42e4@mail.gmail.com>
	<Pine.LNX.4.58.0501311804550.17207@phoenix.infradead.org>
	<1107276561.21196.457.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 Feb 2005, Thomas Gleixner wrote:
> This might turn out to be a GC nightmare. Every update to a file might
> result in shuffling tons of nodes around or at least trying to do so.
>
> Keep it simple.
Agree, this might be too complicate approach.

> Not only GC makes this necessary, every write to a file too.
Agreed.

> I'm not sure which of the mechanisms will provide us more horror. My
> guess is ICP. The summary method is definitely less performant, but I
> think therefor less complicated to handle. So we trade performance for
> simplicity, which makes more sense for me than the other way round.
>

I'll try to describe ICP approach and the horror I may foresee.

Some terms and definitions:
~~~~~~~~~~~~~~~~~~~~~~~~~~
ICP describes nodes and contains *ICP entries*. Each ICP entry corresponds 
to one node.

ICP entry is *valid*, if the node it refers to is valid and is at the 
correct position (i.e., GC didn't move it).

ICP entry is *invalid* if it is not valid.

ICP node is *obsolete* if:
1. the number of its valid ICP entries is less then certain watermark 
(MIN_ICP_ENTRIES);
2. The percentage of its valid ICP entries is less then the certain 
watermark (MIN_ICP_ENTRIES_PERC).

Next, the ICP entries have versions. The next ICP entry has the version of 
the previous one + 1.

Consider use-cases for better understanding. Suppose we have 3 ICP nodes 
for the inode #4. Their versions are 1,2 and 3. Suppose inode #4 has 3000 
nodes (versions 1-3000) if it is the regular file inode or 3000 direntries 
if it is the directory inode.

Case 1.
	ICP node v1 describes nodes v1-1000.
	ICP node v2 describes nodes v1001-2500.
	ICP node v3 describes nodes v2501-3000.
All ICP nodes are valid, everybody are happy.
To build the inode #4 we need to read all three ICPs.

Case 2.
	ICP node v1 describes nodes v1-3000.
	ICP node v2 describes nodes v10-3000.
	ICP node v3 describes nodes 1-2000.
The ICP node v1 is obsolete since there is newer ICP node (v2) which 
describe almost of the nodes of the inode #4. ICP node v2 is valid, but 
contains only 1000 valid ICP entries since entries v0-2000 are overriden 
by the next ICP node. ICP node v3 is valid, it partially overrides ICP 
node v3.
To build inode #4, we need to read ICP node v2 and ICP node v3.

The analogy to the ordinary inode nodes is obvious.

-------------------------------------------------------------

So, how am I offer to operate?
Basically, I offer to keep in-core references to inode's ICPs. Suppose we 
have flash with data and each inode has valid ICP(s). To be not very 
vague, I'll just describe the behavior I expect in different cases.

1.
If the nodes are moved by the GC, some ICP entries become invalid. For 
those nodes, which have been moved, we keep in-core node_ref. Thus, we 
will have two things in-core:
a). ICP reference(s).
b). node_refs for all the invalid ICP entries.

Here we may again, introduce some watermark - the maximum number of 
node_ref which we may have in-core. If we exceed this watermark, we write 
new ICP node to flash. In new ICP node makes the previous one obsolete, we 
include the ICP entries for all nodes to our new ICP. Otherwise, only 
those which were actually changed.

2.
When the file is changed (not appended), the situation is the same as in  
the first example.

3. If the file is appended, old ICPs are not changed. So we just write new 
ICPs which describe newer nodes only.

Several notes:
1. I did not consider the unclean reboot situation. I think this problem 
is handleable, but may make the mount process very complicated.
2. small inodes, which contain few nodes, may not have ICP. I think it is 
reasonable to use the MIN_ICP_ENTRIES watermark here (described above).

Comments?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

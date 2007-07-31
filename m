Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
In-Reply-To: <1185888229.14534.13.camel@kleikamp.austin.ibm.com>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
	<1185799508.3083.20.camel@pmac.infradead.org>
	<1185813909.9523.42.camel@kleikamp.austin.ibm.com>
	<1185883827.3083.109.camel@pmac.infradead.org>
	<1185888229.14534.13.camel@kleikamp.austin.ibm.com>
Content-Type: text/plain
Date: Tue, 31 Jul 2007 16:23:26 +0100
Message-Id: <1185895406.3083.117.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>,
	linux-mtd@lists.infradead.org, ye janboe <janboe.ye@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-31 at 08:23 -0500, Dave Kleikamp wrote:
> We had tried a similar patch, attached here, but it caused problems.
> Maybe our patch is missing something.
> 
> >From the bug report:
> -----------------------------
> Built and ran the 2nd patch (attachment 28493 [edit]).  Results are similar
> as before, jffs2 runs for a little while, but soon complains there's 
> already data at the point where it intends to write. 
> 
> ARGH. About to write node to 0x00140010 on flash, but there's data already 
> there:
> 0x00140010: 19 85 e0 02 00 00 00 ac 0a 3e 48 74 00 00 00 74 

Hm, I think that's probably a _separate_ problem, which you happened to
exacerbate. I don't see how it's related to f->sem locking.

-- 
dwmw2

Date: Wed, 17 Nov 2004 10:06:43 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <Pine.LNX.4.58.0411171003510.5169@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: JFFS2 improvement idea
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David, Ferenc,

I have an Idea concerning to mount time improvement (and may be other) and 
I would Like to discuss it with you.

During the scan process, JFFS2 reads all the node's common headers and 
checks their CRCs.

Direntries are the special case. They are read fully, with name, and all 
CRCs are checked on the scan time.

In the JFFS2 scan process we read direntries and save the correspondent 
jffs2_full_dirent objects in the ic->scan_dents. As I understand, this is 
only needed to for the scan_pass2 process which is needed to mainain the 
correct value of the ic->nlink.

Ok, why do we need names? Because we want to detect the deleted direntries 
(each have the correspondent deletion direntry with target ino = 0). This 
is needed to have the correct value of nlink.

But what are the drawbacks of this?

1. Dusing the scan, we need to keep lists of jffs2_full_dirents in memory 
for all directory inodes. This eats much memory during the scan process.
2. We need to insert each direntry to the list of direntries - this is 
also not very fast.
3. Ferenc must to keep direntry names in his summaries. This complicates  
summary design because names have different lengths. Summary nodes are 
larger.

Ok, what is the idea?

In deletion direntries, why not to store the physical offset of the 
deleted direntry (instead of, say, mctime field)?

What are the advantages?

1. The GC process is simpler. When we GC the deletion direntry node, we 
will know where the deleted direntry is. We will quickly detect if it was 
already Garbage Collected or not. I mead we will not need to have the 
complicated and slow jffs2_garbage_collect_deletion_dirent() function. 
(This should work since the deleted direntries are obsolete and are not 
moved anywhere anymore).

2. On the scan process, we will need to read only direntry headers, no 
need to read names.

3. On scan, we will use smaller structures in the ic->scan_dents field. 
Say, struct jffs2_scan_dent. They will have no 'name' field.

4. On scan, we will use faster list insert function and insert all 
direntries to the beginning of list.

5. Ferenc will not need to save direntry names in summaries nodes. The 
summary patch will be simpler.


It seems we will need to treat the names of direntries as the unchecked 
space, and check them later as we do it with the nodes data.


What do you guys think?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKv2s-0003Ih-8f
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 05:51:10 -0400
Message-ID: <433BB979.7010904@inf.u-szeged.hu>
Date: Thu, 29 Sep 2005 11:52:57 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
In-Reply-To: <20050929093433.GB18741@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:

>>At this moment: yes, that is the only way. If more people need it we ca=
n
>>implement a special extension for EBS. (but it takes time) This
>>extension would make possible if user set a special mount option the
>>system will convert all the non-summarizied erase blocks to summarized.
>>It would take a lot of time (and need some percent free space), but onl=
y
>>at that mount.
>>   =20
>>
>
>Just fyi - such a patch should not get merged into cvs.  Long-term,
>the demand for it will approximate zero, so there is no good
>justification for extra code.
> =20
>
Yes, I agree.

>>Or you may try our other technique: CS (Centralized Summary). That
>>technique does not requie user space tool, and cause very fast mount
>>after any clean umount. (if the umount was not clean the speed will be
>>same as before). It is not the part of the official JFFS2 now, we would
>>like to little bit rewrite before bringing on it. But it works already =
-
>>use the variant which stores the reference in the first erase block. Yo=
u
>>can download it from our webpage ( http://www.inf.u-szeged.hu/jffs2/ ).
>>   =20
>>
>
>How is the CS information found during mount?  Special location?
> =20
>

There is two way (can be selected via kernel config):

The first way stores a reference in the first (usable) erase block. (If
it is not free, it moves the data to somewhere else, and reserve). It
stores only a reference to it at umount, and a "mount-log" at mount
(just to mark that it is invalid in case of unclean umount). It means
one page write at mount, one page write at umount. If the erase block
consist 16 pages than it is necesarry to erase the first erase block
after every 8 mounts. So the typical timelife of it is about 8*100.000
mounting, I think it is big enough.

The other way is to specify the cenratlized summary information with
mount option (not to use the first erase block to store this pointer).
In this case some other system have to store it (typically on an other
file system), and the new location after umount can be read using sysfs.

Ferenc

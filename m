Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ljvpk-0004sj-LU
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 13:29:31 +0000
Message-ID: <49C0F741.4070807@nokia.com>
Date: Wed, 18 Mar 2009 15:29:37 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Gilad Ben-Yossef <gilad@codefidence.com>
Subject: Re: Loop back mounted files on UBIFS file system
References: <49BFC87D.5050608@codefidence.com>
In-Reply-To: <49BFC87D.5050608@codefidence.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gilad Ben-Yossef wrote:
> Hi All,
> 
> 
> I am trying to loop back mount a file (which contains a FAT32 file 
> system image), which resides on a UBIFS file system.
> 
> 
> 
> Command I try:
> 
> *# losetup -o 4096 /dev/loop/0 /mnt/ubifs/fat32
> ***
> 
> 
> Where /nnt/ubifs/ is the mount point of a valid UBIFS file system.
> 
> 
> The response I get is:
> 
> 
> losetup: /dev/loop/0: No such device or address

I tried it quickly with a recent kernel and also on 2.6.24 

	git://git.infradead.org/users/dedekind/ubifs-v2.6.24.git

and it seemed to work.  I could mount and read and write.

/dev/loop/0 does exist doesn't it?  What does losetup -f say?

> 
> 
> Trying a loopback mount from any other file system (such as tmpfs) works.
> 
> 
> Trying to do any other activity with the UBIFS file system works as well.
> 
> 
> Please note that I am NOT trying to loop back mount a file containing a 
> UBIFS file system image and I read the FAQ and understand that this is 
> not directly possible, disregarding nandsim. I am trying to do the 
> opposite - loopback mount a file residing on an UBIFS file system.
> 
> 
> Googling around I've found another post citing what seems like the very 
> same behaviour. The answer there was a reference to the above mentioned 
> FAQ entry, which I believe is not relevant for the aforementioned reasons.
> 
> 
> Kernel version is 2.6.24 with the last back ported UBIFS support. I 
> realize that this is an old version and no longer maintained and I'd be 
> happy to try the latest and greatest, just wanted to make sure this is 
> something that is supposed to work rather then that I am trying to do 
> the impossible.
> 
> 
> 
> Many thanks,
> 
> Gilad
> 

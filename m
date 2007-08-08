Received: from wa-out-1112.google.com ([209.85.146.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIowc-0007oX-E6
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 13:04:45 -0400
Received: by wa-out-1112.google.com with SMTP id v33so241350wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Aug 2007 10:03:32 -0700 (PDT)
Message-ID: <4f6ba3b0708081003u28766bbdg1db917078fc4ad2b@mail.gmail.com>
Date: Wed, 8 Aug 2007 13:03:29 -0400
From: "Bob Beers" <bob.beers@gmail.com>
To: "Andy Kennedy" <akennedy@techmoninc.com>
Subject: Re: DiskOnChip 2000 (DOC 2000) woes.
In-Reply-To: <46B9EE9B.7060805@techmoninc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46B76F31.6020507@techmoninc.com> <46B9EE9B.7060805@techmoninc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I can't address the stack dumps you're seeing,
 but I think you don't want ext3 or
 any journal file system on DoC.
In fact if you do mount the file system rw, you'll
 want to specify the option "noatime" to prevent
 as much chip writing as possible.

And, to give you some hope, I will tell you
 that I have done what you are trying.
fdisk /dev/nftla (create a linux partition or two)
mke2fs /dev/nftla1
mount /dev/nftla1 /mnt/doc
cp blahblahblah /mnt/doc/blahblah
etc. ...
end up with a bootable DoC on a SBC with no other drive.

I hope this helps,
-Bob

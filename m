Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139pcz-0002Xh-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 14:54:13 +0100
From: dr john halewood <john@frumious.unidec.co.uk>
Reply-To: john@frumious.unidec.co.uk
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: doc2000 geometry problem?
Date: Thu, 12 Oct 71684 15:56:05 +0100
Content-Type: text/plain
Cc: mtd@infradead.org
References: <00070511345100.24168@frumious.unidec.co.uk> <10462.962802681@cygnus.co.uk>
In-Reply-To: <10462.962802681@cygnus.co.uk>
MIME-Version: 1.0
Message-Id: <00070514541002.24168@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 05 Jul 2000, David Woodhouse wrote:
>You _are_ using them on the flash device /dev/mtd0 aren't you, not on the 
>nftl device /dev/nftla ?
yup
>
>You shouldn't need to do it though - can you not mount the /dev/nftla1 
>partition? Or reformat it to ext2 with 'mkfs.ext2 /dev/nftla1' ?

This is the funny bit: I mounted the fat partition on /dev/nftla1 happily, but
couldn't see any files on it. Trying to write to it gave a "No Virtual Unit
Chains available" message, and reformatting it this mkfs reported a success but
left the fat partition there. Is the fact that it sees 0 sectors significant or
is this normal?

john


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

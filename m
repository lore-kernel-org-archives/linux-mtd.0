Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU070-00029x-Uz
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 08:40:20 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HU06t-0005eF-NS
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 13:40:11 +0100
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 13:40:11 +0100
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 13:40:11 +0100
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Clarification on multiple mtdram devices - HowTo
Date: Wed, 21 Mar 2007 12:39:54 +0000 (UTC)
Message-ID: <loom.20070321T130947-321@post.gmane.org>
References: <loom.20070319T162102-206@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MikeW <mw_phil <at> yahoo.co.uk> writes:

> 
>From a (much) earlier post, I note that the mtdram driver can emulate
>several /dev/mtd's by "loading the driver more than once".
> 
>Does this mean modprobing *once* but then setting up multiple
>device nodes with the same major number and different minor numbers ?
> 
>I presume this also implies that each device must have the same
size & erasesize.
> 
> Regards,
> MikeW

Found out about doing this here:
http://electrons.psychogenic.com/modules/wordpress/rants/
2005/08/28/13/linux-on-the-go-exploring-ipaq-options.html

(I would like a section doing this properly on the MTD website FAQ
written by an authoritative person - please !)
>>>>>
To start we load a few modules, creating a fake 32M flash device
 in RAM and ensure we have appropriate /dev/ entries:

# modprobe mtdcore
# modprobe mtdram total_size=32768 erase_size=256
# mkdir /dev/mtdblock ; for i in 0 1 2 3 ;
 do mknod /dev/mtdblock/$i b 31 $i; done

Then we write the contents of one of the JFFS2 images
to the MTD RAM device, and take a look:

# dd if=gpe-image-h3600-20050407124742.rootfs.jffs2 of=/dev/mtdblock/0
# mkdir -p /mnt/ipaq/
# mount -t jffs2 /dev/mtdblock/0 /mnt/ipaq
# cd /mnt/ipaq; ls;

The output will be something like:

	bin  boot  dev  etc  home  lib  media  mnt  proc  sbin
  sys  tmp  usr  var
<<<<

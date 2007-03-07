Received: from 206.173.66.57.ptr.us.xo.net ([206.173.66.57]
	helo=zebra.brightstareng.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HP0hs-0000nu-Bs
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 13:17:46 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zebra.brightstareng.com (Postfix) with ESMTP id 4FC0728C296
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Mar 2007 13:17:43 -0500 (EST)
Received: from zebra.brightstareng.com ([127.0.0.1])
	by localhost (zebra [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 06119-10 for <linux-mtd@lists.infradead.org>;
	Wed,  7 Mar 2007 13:17:39 -0500 (EST)
Received: from pippin (unknown [192.168.1.25])
	by zebra.brightstareng.com (Postfix) with ESMTP id 1BC5628C294
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Mar 2007 13:17:39 -0500 (EST)
From: ian@brightstareng.com
To: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 Support for Large Flash Designs
Date: Wed, 7 Mar 2007 13:17:38 -0500
References: <mailman.311.1173272465.2275.linux-mtd@lists.infradead.org>
	<200703071223.07485.ian@brightstareng.com>
	<1173289687.24738.654.camel@localhost.localdomain>
In-Reply-To: <1173289687.24738.654.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703071317.38907.ian@brightstareng.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 March 2007 12:48, Thomas Gleixner wrote:
> SoC devices out of tree are a seperate steaming pile of ... I
> have seen too many chip vendor kernels explode when you just
> try to do anything else than run "hello world" on them.

I agree that this is far from ideal -- I have to deal with this 
all the time.  But I also appreciate that some vendors do 
actually bother to contribute some base code to support their 
designs, even if I have to go in and fix it.

The vendors need to do better job at establishing a framework to 
solicit fixes, improvements and new code from their customers, 
integrate it, and feed it up the tree into the mainline. It is 
clearly to their benefit.

-imcd

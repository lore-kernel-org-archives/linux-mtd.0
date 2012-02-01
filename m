Received: from mail.grid-net.com ([97.65.115.2])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rsey8-0000Fy-0o
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 18:31:45 +0000
Message-ID: <4F298507.5010600@grid-net.com>
Date: Wed, 01 Feb 2012 10:31:35 -0800
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: Comparing UBI volumes to generate patch for upgrades
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am are working on a embedded industrial product that uses UBIFS, but 
we have limitation on amount of data this product can download per year.

So we are trying to figure out how to optimise size of upgrade package.

one option is  use VCDIFF/bsdif or variation there-of and generate a 
binary diff package.

option 2 is write a tool that compares UBI volume layout for revision 1 
and UBI volume layout for revision 2 and then send that difference, 
along the lines of what is outlined in the paper @ 
http://www.icmu.org/icmu2010/Papers/3-1.pdf

We are just getting started writing a tool to compare UBI volumes, but I 
want to send out querry to UBI experts to see if there are some 
fundamental issues with UBI that would make comparing UBI volumes and 
applying such a patch would be a non-starter.

If we do come up with a "decent" enough tool that can compare UBI 
volumes will certainly share it.

-Sam

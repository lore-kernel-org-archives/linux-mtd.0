Received: from natwar.webmailer.de ([192.67.198.70] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Tp7d-0001y1-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 19:01:17 +0000
Content-Type: Multipart/Mixed;
  charset="iso-8859-1";
  boundary="------------Boundary-00=_8QIGIU7LLEFDNIHFB94L"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>,
        Elizabeth Clarke <eclarke@aminocom.com>
Subject: Re: Nand flash: hang after erase
Date: Thu, 24 Jan 2002 20:13:20 +0100
Cc: linux-mtd@lists.infradead.org
References: <3C4FFA62.505BD064@aminocom.com> <9294.1011878619@redhat.com>
In-Reply-To: <9294.1011878619@redhat.com>
MIME-Version: 1.0
Message-Id: <02012420132005.19801@thomas>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--------------Boundary-00=_8QIGIU7LLEFDNIHFB94L
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

On Thursday, 24. January 2002 14:23, David Woodhouse wrote:
> eclarke@aminocom.com said:
> > I'm playing with nandtest on an mtd partition, and found it hangs
> > after it has erased the first block. Putting in some debug I find that
> > it gets as far as the schedule call in mtdchar.c mtd_ioctl line 324
>
> What is erase->state? If the erase attempt has completed, either
> successfully or otherwise, it should be one of the two values which
> prevents the call to schedule().

Hi !
I had the same problem some time ago. I sent my patches along with some 
rewrite for better support of different hardware to Steven Hill, who 
obviously maintains this nand stuff. I never got an answer.

The included diff is against kernel 2.4.17. 

The change in nand.c made NAND running. I have implemented JFFS and it works 
good (only mount time is a little bit ugly). I will try JFFS2 in the next 
weeks.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http: www.autronix.de  

Diff following:


--------------Boundary-00=_8QIGIU7LLEFDNIHFB94L
Content-Type: application/x-bzip2;
  charset="iso-8859-1";
  name="mtd.diff.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mtd.diff.bz2"

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
YYh/8XckU4UJDVJmrRA=

--------------Boundary-00=_8QIGIU7LLEFDNIHFB94L--

Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gx1Yu-0001VC-J6
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 08:32:49 -0500
Received: by nf-out-0910.google.com with SMTP id i2so1286435nfe
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Dec 2006 05:32:46 -0800 (PST)
Message-ID: <625fc13d0612200532i56913012oceed9c217327c051@mail.gmail.com>
Date: Wed, 20 Dec 2006 07:32:45 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: Darshak <darshak@elitecore.com>
Subject: Re: Intel flash
In-Reply-To: <4589385B.00000B.01208@ELITECORE1561>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4589385B.00000B.01208@ELITECORE1561>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/20/06, Darshak <darshak@elitecore.com> wrote:
> Hi,
>
> I have read that INTEL has strataflash.

Yes.  Read their website on flash chips.

> Is it bare NAND/nor file system?what is its basic use in Linksys?

It's a type of NOR flash chip.  We have no idea what it's usage is in
Linksys.  Especially given that Linksys is a company, so it could be
used for a variety of things.

> What file system does it use? Can we have JFFS2 for that ?

Strataflash can be used with several filesystems, including JFFS2,
assuming there is an underlying device driver in MTD that can talk to
it.

> What is difference in CF flash/DOC flash and this INTEL flash .?

CF flash doesn't show up as real flash.  It shows up as an IDE device.
 Intel flash is a raw flash chip and it's up to a board designer to
determine how it is addressed.

josh

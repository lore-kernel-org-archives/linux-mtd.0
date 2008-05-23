Received: from py-out-1112.google.com ([64.233.166.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzQj7-000198-Sl
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 06:26:06 +0000
Received: by py-out-1112.google.com with SMTP id a73so403398pye.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 May 2008 23:26:04 -0700 (PDT)
Message-ID: <80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
Date: Fri, 23 May 2008 08:26:04 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: James <jamessteward@optusnet.com.au>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
In-Reply-To: <1211437223.6129.82.camel@Ubuntu-Desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/5/22 James <jamessteward@optusnet.com.au>:
> Hi All,
>
> I get very little joy from the NAND flash on my AT91SAM9263-EK board.

Hi !
I didn't have those kind of problems with the sam9263-ek
have you tried to erase the device, mount it with jffs2 or yaffs2,
write a file, unmount, mount and read back the file ?

richard.

Received: from linode.davidb.org ([72.14.176.16] helo=mail.davidb.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8dXc-0002WG-ME
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 16:28:33 +0000
Date: Fri, 5 Dec 2008 08:28:31 -0800
From: David Brown <mtd@davidb.org>
To: Du Zhongdong <axdududu@gmail.com>
Subject: Re: [NAND] Do we support COPY_BACK operation in nand flash?
Message-ID: <20081205162831.GA19729@linode.davidb.org>
References: <7ccead5b0812050022hed8dbb7p4957aace524b924a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7ccead5b0812050022hed8dbb7p4957aace524b924a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 05, 2008 at 04:22:09PM +0800, Du Zhongdong wrote:

>I'm trying to writing a mtd-based driver for HY27UK08BGFM nand flash,
>and in the data sheet, there's a COPY-BACK program which is
>'configured to quickly and efficiently rewrite data stored in one page
>without utilizing an external memory.'

Do keep in mind that copy-back doesn't verify the ECC on the data, so
if it is used for garbage collection errors will accumulate.

David

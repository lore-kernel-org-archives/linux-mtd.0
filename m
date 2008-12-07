Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L99mk-0006qr-FU
	for linux-mtd@lists.infradead.org; Sun, 07 Dec 2008 02:54:18 +0000
Received: by rv-out-0708.google.com with SMTP id b17so662597rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sat, 06 Dec 2008 18:54:16 -0800 (PST)
Message-ID: <7ccead5b0812061854v799918e5g9cedfbdba462c356@mail.gmail.com>
Date: Sun, 7 Dec 2008 10:54:16 +0800
From: "Du Zhongdong" <axdududu@gmail.com>
To: "David Brown" <mtd@davidb.org>
Subject: Re: [NAND] Do we support COPY_BACK operation in nand flash?
In-Reply-To: <20081205162831.GA19729@linode.davidb.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <7ccead5b0812050022hed8dbb7p4957aace524b924a@mail.gmail.com>
	<20081205162831.GA19729@linode.davidb.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 6, 2008 at 12:28 AM, David Brown <mtd@davidb.org> wrote:
> On Fri, Dec 05, 2008 at 04:22:09PM +0800, Du Zhongdong wrote:
>
>> I'm trying to writing a mtd-based driver for HY27UK08BGFM nand flash,
>> and in the data sheet, there's a COPY-BACK program which is
>> 'configured to quickly and efficiently rewrite data stored in one page
>> without utilizing an external memory.'
>
> Do keep in mind that copy-back doesn't verify the ECC on the data, so
> if it is used for garbage collection errors will accumulate.
>
> David
>


thanks, David. I didn't think of that before :)


Du Zhongdong

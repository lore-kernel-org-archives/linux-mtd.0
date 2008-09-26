Received: from el-out-1112.google.com ([209.85.162.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kj8fI-0005vp-Mx
	for linux-mtd@lists.infradead.org; Fri, 26 Sep 2008 08:27:04 +0000
Received: by el-out-1112.google.com with SMTP id y26so269881ele.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Sep 2008 01:27:03 -0700 (PDT)
Message-ID: <fe810cf0809260127rcf979bdt498abcd9dd28f59@mail.gmail.com>
Date: Fri, 26 Sep 2008 12:27:03 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: [PATCH] mtd: fix cfi_cmdset_0001 FL_SYNCING race (take 2)
In-Reply-To: <alpine.LFD.2.00.0809251053450.3635@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1KirHY-0009gF-00.abelyako-mail-ru@f144.mail.ru>
	<alpine.LFD.2.00.0809251053450.3635@xanadu.home>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Alexander Belyakov <abelyako@mail.ru>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Alexander Belyakov <abelyako@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 25, 2008 at 6:57 PM, Nicolas Pitre <nico@cam.org> wrote:
>
> You should put your Signed-off-by line above the 3 dashes.  Everything
> below the 3 dashes is ignored for the commit log.

Oops. Going to fix that.

>
> Acked-by: Nicolas Pitre <nico@cam.org> otherwise.

Thank you.

Alexander

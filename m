Received: from mail-gx0-f176.google.com ([209.85.217.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M3Q52-0002oV-LK
	for linux-mtd@lists.infradead.org; Mon, 11 May 2009 07:37:51 +0000
Received: by gxk24 with SMTP id 24so5580871gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 May 2009 00:37:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
Date: Mon, 11 May 2009 03:37:43 -0400
Message-ID: <8bd0f97a0905110037m4f053781n6521aeda03514f39@mail.gmail.com>
Subject: Re: [PATCH 0/3] libubi / mkfs.ubifs #2
From: Mike Frysinger <vapier.adi@gmail.com>
To: Corentin Chary <corentincj@iksaif.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 9, 2009 at 05:41, Corentin Chary wrote:
> These patchs will allow mkfs.ubifs to write the image directly
> on an UBI volume. This time libubi is used. I couldn't manage to
> make the Makefile works correctly, even with Mike trick for dependencies.
> Mike, could you help me on that ?
> You can still make it compile with "cd ubi-utils; make; cd ../mkfs.ubifs; make"

is there a git tree with these patches sitting in them ?
-mike

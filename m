Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqKs-0003J7-QT
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:04:23 +0000
Received: by fxm14 with SMTP id 14so4229150fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:04:21 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307429769.11104.47.camel@localhost>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-4-git-send-email-vapier@gentoo.org>
	<1307429436.11104.43.camel@localhost>
	<1307429769.11104.47.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 03:04:01 -0400
Message-ID: <BANLkTi=AaX1aSeHM5CLhh8XujKCUysWRhw@mail.gmail.com>
Subject: Re: [PATCH 4/6] libmtd: add helper funcs for getting fds, regioninfo,
	and locked info
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 7, 2011 at 02:56, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 09:50 +0300, Artem Bityutskiy wrote:
>> We indeed have -m option in mtdutils which opens a device by its number.
>> But I think it was a mistake. Generally, MTD devices can have any name,
>> it is up to udev configuration. So I'd rather deprecate and would
>> require a list of device node names.
>
> Sorry, I was not clear. I wanted to say that supports -m and does
> hard-code the mtd device name. But this was a mistake because it gives a
> bad example, and adding more hard-coded names is bad.
>
> So I think this option can be deprecated and removed, and we should only
> accept full device node names.

i only added this because mtdinfo has the -m option.  i have no
problem with punting that and going back to requiring people to
specify the path to the device nodes.  i'm off now though, so i'll get
to it tomorrow.
-mike

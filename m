Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz7bn-0007vz-9i
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 12:42:36 +0000
Received: by pxi4 with SMTP id 4so1012675pxi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 05:42:33 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED5FC9E@Cloud.RL.local>
References: <AANLkTim3U4i0y0jtV1SmJvGUR8vAiyiqv8HetVHXFN6a@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE093ED5FC9E@Cloud.RL.local>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 24 Sep 2010 08:42:13 -0400
Message-ID: <AANLkTin1sWJsqDL3dbWMd6-cqX_b8Wi82hZ0=CRekNrm@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd-utils: unify flash_erase and flash_eraseall
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 24, 2010 at 01:42, Jon Povey wrote:
> Mike Frysinger wrote:
>> On Fri, Sep 24, 2010 at 00:35, Jon Povey wrote:
>>> But anyway; will the flash_eraseall script still get installed by
>>> make install? it needs to.
>>
>> it will not, but i didnt think that to be too much of a problem.
>> people usually dont use `make install` for their embedded system ...
>> they pluck out the one or two utils they actually need.
>
> "I suppose" is not much of an argument for breaking make install.
> It can be made to work.. I could do this but don't have time right now.

you call it "breakage", i call it "intended behavior"

it's trivial to make it work as a one off:
+install: TARGETS += flash_eraseall
-mike

Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M3QPQ-0007Z8-Gh
	for linux-mtd@lists.infradead.org; Mon, 11 May 2009 07:58:54 +0000
Received: by wf-out-1314.google.com with SMTP id 23so2049299wfg.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 May 2009 00:58:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8bd0f97a0905110037m4f053781n6521aeda03514f39@mail.gmail.com>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
	<8bd0f97a0905110037m4f053781n6521aeda03514f39@mail.gmail.com>
Date: Mon, 11 May 2009 09:58:46 +0200
Message-ID: <71cd59b00905110058s7b87b73cv5ceb05b6d82dc0cd@mail.gmail.com>
Subject: Re: [PATCH 0/3] libubi / mkfs.ubifs #2
From: Corentin Chary <corentin.chary@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, May 11, 2009 at 9:37 AM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> On Sat, May 9, 2009 at 05:41, Corentin Chary wrote:
>> These patchs will allow mkfs.ubifs to write the image directly
>> on an UBI volume. This time libubi is used. I couldn't manage to
>> make the Makefile works correctly, even with Mike trick for dependencies.
>> Mike, could you help me on that ?
>> You can still make it compile with "cd ubi-utils; make; cd ../mkfs.ubifs; make"
>
> is there a git tree with these patches sitting in them ?
> -mike

Yep
http://git.iksaif.net/?p=users/iksaif/mtd-utils.git;a=shortlog;h=refs/heads/for-upstream
git://git.iksaif.net/users/iksaif/mtd-utils.git for-upstream


-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org

Received: from mail-qc0-x22c.google.com ([2607:f8b0:400d:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xcf5j-0002xY-Rt
 for linux-mtd@lists.infradead.org; Fri, 10 Oct 2014 18:39:04 +0000
Received: by mail-qc0-f172.google.com with SMTP id o8so2445850qcw.3
 for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2014 11:38:42 -0700 (PDT)
In-Reply-To: <CAFLxGvzbpjgt4EzUiWW3eqZLb8Eyz8vMJYrcdLvs2sS-kiFEBg@mail.gmail.com>
References: <d4a8ef19-1bb5-4d81-9b04-ca9886e7f209@email.android.com>
 <CAFLxGvzbpjgt4EzUiWW3eqZLb8Eyz8vMJYrcdLvs2sS-kiFEBg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: How do I know my UBI/UBIFS code version?
From: Woody Wu <narkewoody@gmail.com>
Date: Sat, 11 Oct 2014 02:38:29 +0800
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <1197b309-a9e9-4976-8845-165a4e634bd0@email.android.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On October 10, 2014 11:28:26 PM GMT+08:00, Richard Weinberger <richard.weinberger@gmail.com> wrote:
>On Fri, Oct 10, 2014 at 4:57 PM, Woody Wu <narkewoody@gmail.com> wrote:
>> I am running ubi/ubifs on a ported ARM linux 3.1.x.  How do I get
>know my ubi/ubifs version? In additional, if I found the version are
>too old, could I simply copy a newer version source files to my 3.1 ARM
>linux tree?
>
>Ported in terms of utterly broken by a SoC vendor? ;-)
>If your kernel version is v3.1 then also UBI and UBIFS is v3.1 unless
>someone messed with it.
>To find out you need to consult the changelog.
>
>And no, you cannot simply copy&paste the sources files between kernel
>releases as the internal kernel API is
>a moving target.

'ubinfo -a' returns to me "UBI version: 1" in its first line output.  Does it looks strange to you?  Thanks.

-woody, sent from mobile

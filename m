Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUIAw-00016u-Aa
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 18:10:39 +0000
Received: by mail-io0-x236.google.com with SMTP id l127so99352993iof.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 10:10:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC=U0a1GONoijN40RSpw-QZje1fbSCmAV8=8JuSOdyWf=pqb0w@mail.gmail.com>
References: <CACna6rxZCkeCijReQDSr2Jc7m8q0J7qp=nhNgnkFFzk312wSdg@mail.gmail.com>
 <CACna6rz9ppFXqhh6=m7cnmQ58y=4w4X8f_DM_8Y0ePZ71BoL3g@mail.gmail.com>
 <CAC=U0a1vj1020X8BjvYGSOi7GrJCAad3A8wCeosuEo+7i4Rk3A@mail.gmail.com>
 <20160208192111.GA62607@google.com>
 <CAC=U0a0VSUxDPDEi16A_RvbkE89KUDtQjOj3K+d9GTxrbJxULQ@mail.gmail.com>
 <CACna6rz=0CEE_S_JPX8Nvxzdk5A_0X2ScFg-kGphsC6aMf_m7Q@mail.gmail.com>
 <CAC=U0a1GONoijN40RSpw-QZje1fbSCmAV8=8JuSOdyWf=pqb0w@mail.gmail.com>
Date: Fri, 12 Feb 2016 19:10:17 +0100
Message-ID: <CACna6rwF67Lb=SikgxgH+KAyXtU+iCH0eD_3oyCQfw0B01NveQ@mail.gmail.com>
Subject: Re: brcmnand (iproc): bitflips and ECC errors due to ignored ECC
 config
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 February 2016 at 17:16, Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> Thanks for pointing this out, will send a patch with the above solution.

Oh, I already started working on this. Let me send patches so you can
see if you like it.

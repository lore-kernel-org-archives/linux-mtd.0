Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb3s7-0006NU-0g
 for linux-mtd@lists.infradead.org; Mon, 06 Oct 2014 08:42:24 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so4969046pab.12
 for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2014 01:42:01 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1410060950270.17221@lnxricardw1.se.axis.com>
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
 <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
 <alpine.DEB.2.02.1410060950270.17221@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: Block numbers of BEB
From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 06 Oct 2014 15:41:53 +0700
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Message-ID: <22ddcb2d-d790-4e3e-af60-6bae0465295a@email.android.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On October 6, 2014 2:53:01 PM GMT+07:00, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>
>On Sun, 5 Oct 2014, Woody Wu wrote:
>
>> What I said of checking /proc is wrong. What I indeed checked was 
>> /sys/class/ubi as you mentioned. The problem is, under the 
>> /sys/class/ubi, there is no information about what blocks are marked
>as 
>> bad, there is only information about the total number of bad blocks.
>
>I was thinking the mtd tool nanddump displayed which blocks were bad
>when 
>dumping, but a quick test just now revealed that that doesn't seem to
>be 
>the case.
>
>The information is available to userspace though, so it's fairly easy
>to 
>hack together a userspace tool that gets the bad block information via 
>ioctls.

Do you know in what kernel .c file that contain the information?  Is it in mtd or ubi?

>
>/Ricard

-- 
sent from mobile

Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIN2X-0000yn-0C
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 19:52:09 +0000
Received: by mail-la0-f50.google.com with SMTP id hs14so44492645lab.9
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 11:51:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54CFD1FB.5030208@nod.at>
References: <1422894152-29362-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAFLxGvzdAFUFU2=ySRMdtAk=7hKvuHixrvPX0X+T533VPu=4dg@mail.gmail.com>
 <CAPybu_3D1cG3YpB8Y6h+UX2V7NN5Z9+BmDABt4J=6++KS=E8PQ@mail.gmail.com>
 <54CFD1FB.5030208@nod.at>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 2 Feb 2015 20:51:24 +0100
Message-ID: <CAPybu_2EM3eCNXQCtvhS-07WX9VWZaBi8waJidL103RO1VJjPg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Expose partition offset to the drivers
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard

>
> Hmm, will we ever need the new function for in-tree drivers?
> In general we add new functions only if they have an in-tree user
> for it.

It is part of a driver for a camera at qtec.com .

The policy so far has been that we offer the code to our clients but
we cannot afford to push all the drivers to upstream, not because we
don't want to, but because it is very time consuming and we are
constantly improving the devices. Once there is a higher number of
cameras on the field, I am pretty sure that there will be a group of
people just pushing the drivers upstream.

What we can afford now is trying to push the changes/improvement that
we do the infrastructures, hoping that it will be useful for somebody
else.

So in the short term there will be no driver using the function but if
we had that need I guess there is somebody else needing it.

Regards!


-- 
Ricardo Ribalda

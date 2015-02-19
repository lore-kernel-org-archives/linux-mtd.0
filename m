Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YORkA-0003uP-1Q
 for linux-mtd@lists.infradead.org; Thu, 19 Feb 2015 14:06:19 +0000
Received: by mail-vc0-f179.google.com with SMTP id hy4so1181027vcb.10
 for <linux-mtd@lists.infradead.org>; Thu, 19 Feb 2015 06:05:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1502190954020.17631@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1502190954020.17631@lnxricardw1.se.axis.com>
Date: Thu, 19 Feb 2015 15:05:55 +0100
Message-ID: <CAFLxGvz24i87Y-phXizLUebBkkJWdhTiw6m_8xmF5b5_tSP87A@mail.gmail.com>
Subject: Re: fastmap support in ubinize?
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 19, 2015 at 9:57 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> Was flashmap support ever added to ubinize ? I can't see any reference to
> it in the code, unless it is implicit somehow.

No.

I hope Tanya is allowed to share her code soon such that I can review it.
Adding fastmap to ubinize is not trivial as you can run into problems
when your flash has bad blocks.
i.e, If fastmap refers to PEB XY but PEB XY is bad. Then the flasher
would have to be a) UBI aware and b) had to fixup the fastmap on-fly.

-- 
Thanks,
//richard

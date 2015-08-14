Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQFyk-000107-Ae
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 14:29:06 +0000
Received: by obbfr1 with SMTP id fr1so62506701obb.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 07:28:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55CDF72B.9060309@ti.com>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <8AC930D6-9BEE-4AA8-99AC-962027CCF336@sigma-star.at>
 <CAOMqctQUgbukQ-h9vznwu2JrNBaZJeuL1jQiAgG59s9qHzS14Q@mail.gmail.com>
 <CAPcvp5Ee8=mpPcw+nsNfwyw9-ojyNB7cZk9ygrJj-rZWQ4qwkw@mail.gmail.com>
 <55CDF72B.9060309@ti.com>
Date: Fri, 14 Aug 2015 16:28:44 +0200
Message-ID: <CAFLxGvx8Xk6+_hjB6XGtyC4zvzb-SWPVG5ss-cL2=2XraQVGsQ@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: Andrew Murray <amurray@embedded-bits.co.uk>,
 Michal Suchanek <hramrach@gmail.com>, David Gstir <david@sigma-star.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 14, 2015 at 4:11 PM, Murali Karicheri <m-karicheri2@ti.com> wrote:
> Did you looked into how to use the encryption key from secure storage in SoC
> itself such as one from OTP memory?  In such case, is there an API retrieve
> the key from such storage?

The key setup should really be done in userspace.
Exactly how dm_crypt does.
Then your key can be stored anywhere.

-- 
Thanks,
//richard

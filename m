Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu5IZ-0000yV-5R
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 21:08:52 +0000
Received: by wmeg8 with SMTP id g8so52131849wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 13:08:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87d1vpbi0f.fsf@belgarion.home>
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1446653626-14802-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <87d1vpbi0f.fsf@belgarion.home>
Date: Wed, 4 Nov 2015 18:08:28 -0300
Message-ID: <CAAEAJfA2xBaWiByRoxn5ZKMtbBAuqGP+3jrBOXrdojhR71EaZA@mail.gmail.com>
Subject: Re: [PATCH 3/6] nand: pxa3xx: Simplify pxa3xx_nand_scan
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 November 2015 at 17:56, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> This commit simplifies the initial configuration performed
>> by pxa3xx_nand_scan. No functionality change is intended.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Yes, I like this one very much.
>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
>

Cool. BTW, The subject is wrong and should be:

"mtd: pxa3xx_nand: Simplify pxa3xx_nand_scan"

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar

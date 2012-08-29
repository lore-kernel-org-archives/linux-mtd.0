Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6l2J-0008Vl-Kb
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 16:22:36 +0000
Received: by wibhq4 with SMTP id hq4so4664162wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 09:22:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346249180.2848.485.camel@sauron.fi.intel.com>
References: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>
 <1346249180.2848.485.camel@sauron.fi.intel.com>
Date: Wed, 29 Aug 2012 09:22:33 -0700
Message-ID: <CAN8TOE80Lu0i_L_ppFHY4C2eSnigrA1DN-SsXkhTYYqJpn-E8A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Added a device flag for subpage read support
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 29, 2012 at 7:06 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2012-08-13 at 16:35 -0500, Jeff Westfahl wrote:
>> Added a NAND device flag for subpage read support. Previously this was
>> hard coded based on large page and soft ECC.
>> Updated base NAND driver to use the new subpage read flag if the NAND is
>> large page and soft ECC.
>>
>> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
>
> Pushed to l2-mtd.git, thanks!

I don't have a good system that supports subpage reads, but this patch
looks fine. I forgot to ack:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>

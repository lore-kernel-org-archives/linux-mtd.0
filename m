Received: from mail-vb0-x233.google.com ([2607:f8b0:400c:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcJY2-0006Zq-Jt
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 18:34:19 +0000
Received: by mail-vb0-f51.google.com with SMTP id w5so2554160vbf.24
 for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2013 11:33:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1383296488.2722.74.camel@sauron.fi.intel.com>
References: <1383186575-31328-1-git-send-email-computersforpeace@gmail.com>
 <20131031190432.GB2498@localhost>
 <1383296488.2722.74.camel@sauron.fi.intel.com>
Date: Fri, 1 Nov 2013 14:33:57 -0400
Message-ID: <CAN8TOE8LRzLTHcGDCb86t0P7fz-c-WNMy4PjpPGgEL9SYgh2gg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand_bbt: kill NAND_BBT_SCANALLPAGES
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 1, 2013 at 5:01 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2013-10-31 at 16:04 -0300, Ezequiel Garcia wrote:
>> On Wed, Oct 30, 2013 at 10:29:35PM -0400, Brian Norris wrote:
>> > Now that the last user of NAND_BBT_SCANALLPAGES has been removed, let's
>> > kill this peculiar BBT feature flag.
>> >
>> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>
>> Reviewed-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>
> Yes, I do agree that we do not need to keep dead code just in case.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Pushed to l2-mtd.git.

Brian

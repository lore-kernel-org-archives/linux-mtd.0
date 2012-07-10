Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoPwv-0000Jk-Re
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2012 02:13:16 +0000
Received: by yenr9 with SMTP id r9so11612039yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2012 19:13:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120626153944.45c0aee0@pixies.home.jungo.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-6-git-send-email-computersforpeace@gmail.com>
 <20120626153944.45c0aee0@pixies.home.jungo.com>
Date: Mon, 9 Jul 2012 19:13:08 -0700
Message-ID: <CAN8TOE88o0sDSUdP_AHjZhq_T5kOUdgQmBe+gqiZage8e7T-BA@mail.gmail.com>
Subject: Re: [PATCH 5/8] mtd: nand: rename '_raw' BBT scan functions
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 26, 2012 at 5:39 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Fri, 22 Jun 2012 16:35:42 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
>> None of these scanning functions use MTD_OPS_RAW mode any more, so there's
>> really nothing 'raw' about them. Rename them to (hopefully) make the code
>> a little clearer.
>
> Minor nitpick: I guess this patch should be the last in your patchset.

You're correct. I think I somewhat-arbitrarily rearranged (rebased)
some of these patches before submission. Will fix if/when I resubmit.

Thanks,
Brian

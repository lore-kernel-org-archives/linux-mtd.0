Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7mdn-0007GJ-A7
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 11:45:15 +0000
Received: by wibhj13 with SMTP id hj13so5284494wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2012 04:45:13 -0700 (PDT)
Date: Wed, 14 Mar 2012 13:45:09 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
Message-ID: <20120314134509.0866c5ac@pixies.home.jungo.com>
In-Reply-To: <20120314130543.3ceacacc@pixies.home.jungo.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <20120314130543.3ceacacc@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Mar 2012 13:05:43 +0200 Shmulik Ladkani <shmulik.ladkani@gmail.com> wrote:
> 
> Conclusion:
> As long as 'euclean_threshold' is kept to its default and not tweaked by
> the sysfs knob, MTD system no longer reports -EUCLEAN.
> 
> Was that the intention? Did I miss something here?

Yes, I missed something and got it wrong.
Further meditation enlightened me.

No need to reply on this comment. Sorry.

Regards,
Shmulik

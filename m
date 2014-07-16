Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7OeS-00017I-C7
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:49:41 +0000
Message-ID: <53C674CB.8060806@nod.at>
Date: Wed, 16 Jul 2014 14:49:15 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com, Richard Genoud <richard.genoud@gmail.com>
Subject: Re: ubifs error at boot "bad node type"
References: <53BBC39F.7010307@gmail.com>	
 <1405499347.1906.2.camel@sauron.fi.intel.com>	
 <CAFLxGvwzzAAswamDJVq0UW7DLdHdgA4N_KOY9K5FhAREaFit+g@mail.gmail.com>	
 <CACQ1gAjM-=ZnjFQocXq1Ygg0gN-D-1G1Q-=kZqsfm-Du7jmFow@mail.gmail.com>
 <1405513986.5423.19.camel@sauron.fi.intel.com>
In-Reply-To: <1405513986.5423.19.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.07.2014 14:33, schrieb Artem Bityutskiy:
>> Well, actually, fastmap is used on this volume when I boot from NAND.
>> (and I must say, It's fast !)
>> Just this time, as I boot from nfsroot, or from a unclean state,
>> fastmap didn't attached UBI.
>> I'll check if it's still operational.
> 
> Just a head-up: check the Kconfig message for this option, it says that
> even the on-flash format for it may change, although I am not quite sure
> if Richard W. still means this.

Correct, fastmap *is* experimental.
But I'm eager to sort issues out.
And the very last thing I'd do is changing the on-flash layout.

Now the bad news, currently nobody pays me to work on UBI/Fastmap.
This means that paid projects go first.

Thanks,
//richard

Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLvGG-0001aS-E0
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 13:56:28 +0000
Date: Fri, 7 Mar 2014 10:55:44 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Annoying ML complains about "suspicious header"
Message-ID: <20140307135544.GA27354@arch.cereza>
References: <CACna6rzSrnx8ueOn1O5k62eTppPDRVFgTA56WgQQqWUW1asMJw@mail.gmail.com>
 <1393325817.3412.94.camel@sauron.fi.intel.com>
 <CAN8TOE8Cu0fkdV7J6ZxMAoN0oAdvBMFQETMZUa7sp0v3wocJ6w@mail.gmail.com>
 <1394009048.6302.12.camel@sauron.fi.intel.com>
 <1394017388.21141.56.camel@i7.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394017388.21141.56.camel@i7.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 05, David Woodhouse wrote:
[..]
> The complexity with the threading check is that it has false positives
> with patch sets, because we *expect* those to be in a thread but without
> the normal 'Re:' in the subject. The check already does have an
> exemption if it finds [Pp][Aa][Tt][Cc][Hh] in the subject — Rafał,
> looking at the four messages in the moderation queue from you, if you'd
> just said [RFC PATCH] and [WIP PATCH] instead of just [RFC] and [WIP]
> alone, then they'd have sailed straight through.
> 

FWIW, the LAKML also has this rule. IIRC, I've been bitten by it.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

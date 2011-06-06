Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTV6h-0006LP-Ui
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:24:21 +0000
Received: by wyb28 with SMTP id 28so3648552wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:24:18 -0700 (PDT)
Message-ID: <4DEC8EB6.4030609@gmail.com>
Date: Mon, 06 Jun 2011 12:24:22 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 050/104] physmap_of: separate parse_obsolete_partitions
	to separate parser
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>	
	<1307026293-8535-16-git-send-email-dbaryshkov@gmail.com>	
	<1307347330.3135.29.camel@localhost> <4DEC8B45.1020900@gmail.com>	
	<1307347880.3135.35.camel@localhost>
	<1307348018.3135.36.camel@localhost>
In-Reply-To: <1307348018.3135.36.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06.06.2011 12:13, Artem Bityutskiy wrote:
> On Mon, 2011-06-06 at 11:11 +0300, Artem Bityutskiy wrote:
>> I understand your desire to keep physmap_of nice and shiny and have all
>> the crap separate, but that is really too small amount of code to even a
>> separate file. And after all, that's physmap_of's crap,
>
> Or rather s/phusmap_of/ofpart/

I've initially thought about this, but didn't want to put too much crap 
to ofpart. Will follow this way, as you suggest.

-- 
With best wishes
Dmitry

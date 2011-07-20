Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjYIa-000566-QO
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 15:02:58 +0000
Received: by yxj20 with SMTP id 20so153314yxj.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 08:02:50 -0700 (PDT)
Message-ID: <4E26EE23.4030805@gmail.com>
Date: Wed, 20 Jul 2011 11:02:59 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: Preventing JFFS2 partial page writes?
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>
	<4E020A36.6070708@gmail.com> <1308943581.13493.15.camel@koala>
	<4E089441.3010809@gmail.com> <1309253646.23597.58.camel@sauron>
	<4E0A23D3.8060303@gmail.com> <1309329223.23597.116.camel@sauron>
	<4E0CBAE5.6050604@gmail.com> <20110701205205.GA4600@parrot.com>
In-Reply-To: <20110701205205.GA4600@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Peter Barada <peter.barada@logicpd.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/01/2011 04:52 PM, Ivan Djelic wrote:
> On Thu, Jun 30, 2011 at 07:05:25PM +0100, Peter Barada wrote:
> (...)
>>>> Another issue this exposes is that JFFS2 reads/compares the cleanmarker
>>>> w/o any ECC in the marker data to verify its validity - if a bitflip in
>>>> an unECC'd cleanmarker is read back, then I think JFFS2 will fail to use
>>>> that block.
>>> No, I think what JFFS2 should do is just assume the eraseblock needs
>>> erasure and just erase it. The whole purpose of clean markers is to
>>> erase less. If it is corrupted - we just do an extra erase - not big
>>> deal.
>> How's the best way to do this?  That would make this whole problem just
>> go away, and make MLC devices much more happy with JFFS2.
> I think Artem was just explaining that a single corrupted cleanmarker is no
> big deal, it just forces JFFS2 to perform an extra erase. That does not mean
> you can get rid of cleanmarkers, because systematically erasing a block before
> programming it would seriously degrade write performance.
What I meant was that for the first write to a block (which I hope will 
be to the page that contains the cleanmarker), erase the block before 
the write, merge the page data and clean marker into one write).  This 
shouldn't degrade performance that much (and could be enabled/disabled 
by a mount option).  If that is possible (and someone can provide a 
pointer to me on how to do such) its a much better solution than 
butchering ecclayout.

> --
> Best Regards,
>
> Ivan


-- 
Peter Barada
peter.barada@gmail.com

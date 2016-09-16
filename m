Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkt97-0004XT-6R
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 13:25:41 +0000
Subject: Re: [PATCH v2 16/17] UBI: hide EBA internals
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473087908-27862-17-git-send-email-boris.brezillon@free-electrons.com>
 <646e09d9-d148-b21b-d411-75ebb05dd121@nod.at>
 <20160916133808.1dd5db40@bbrezillon>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <96f3926d-72f3-65f6-0692-342ee9ab5b14@nod.at>
Date: Fri, 16 Sep 2016 15:24:31 +0200
MIME-Version: 1.0
In-Reply-To: <20160916133808.1dd5db40@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 16.09.2016 13:38, Boris Brezillon wrote:
> ubi_eba_destroy_table() was only exported (made non-static) to let vmt
> code free an EBA table if the resize operation fails in the middle
> (between ubi_eba_create_table() and ubi_eba_set_table() calls).
> 
>> I'm also not really happy with the name ubi_eba_set_table() because it does
>> more the setting the table. It destroys also the old one.
> 
> I can definitely rename the function. How about ubi_eba_replace_table().

Reads much better (to me). :-)

>>
>> What I'm trying to say is, when we bite the bullet and introduce lots of new wrapper
>> functions to hide internals I want very clear and describing names for them.
> 
> I understand and I agree.
> I thought ubi_eba_set_table() was accurately describing the function
> purpose: assigning an EBA table to a volume. The fact that the old
> table (if any) is freed when the new one is assigned is just an
> internal detail, and that should not impact the user behavior.
> But I'm perfectly fine renaming this function.

Thanks,
//richard

Received: from mercuryimc.plus.com ([80.229.200.144]
 helo=centos1.newflow.co.uk)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAzhs-0003Id-Ik
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 09:23:19 +0000
Message-ID: <512F2201.6010407@mimc.co.uk>
Date: Thu, 28 Feb 2013 09:23:13 +0000
From: Mark Jackson <mpfj-list@mimc.co.uk>
MIME-Version: 1.0
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: Re: linux-next: JFFS2 corruption
References: <512CD9BA.3080300@mimc.co.uk>
 <20130227101824.6e18ba21fb99070594420f29@canb.auug.org.au>
 <512E2241.9040705@mimc.co.uk>
 <518397C60809E147AF5323E0420B992E3EA8EF4A@DBDE01.ent.ti.com>
In-Reply-To: <518397C60809E147AF5323E0420B992E3EA8EF4A@DBDE01.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 lkml <linux-kernel@vger.kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28/02/13 04:11, Philip, Avinash wrote:
> On Wed, Feb 27, 2013 at 20:42:01, Mark Jackson wrote:
>>
>> Okay, just tested 3v8 plus:-
>>
>> https://patchwork.kernel.org/patch/1931251/
>> https://patchwork.kernel.org/patch/1931221/
>> https://patchwork.kernel.org/patch/1931201/
>> and changed drivers/mtd/nand/elm.c, line 388 "ti,am33xx-elm" to "ti,am3352-elm"
>>
>> This produces an identical corruption.
>>
>> I have also tested next-20130225 and next-20130227, and both cause the same corruption.
> 
> JFFS2 is not supported in am335x with BCH8 ecc scheme because of ECC layout constraints.
> Reasons for disabling JFFS2 support documented in the wiki
> http://processors.wiki.ti.com/index.php/AM335x_JFFS2_Support_Guide#Reasons_for_disabling_JFFS2_support

Aha ... thanks for the link.

I'll move over to UBIFS then, although I did have issues with that too (which is why I went back
to JFFS2), but I'll start another thread if needs be.

Cheers
Mark J.

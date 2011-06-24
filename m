Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qa827-0004Xq-Nv
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 15:11:01 +0000
Received: by gwb1 with SMTP id 1so1369599gwb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 08:10:07 -0700 (PDT)
Message-ID: <4E04A8C4.8000206@gmail.com>
Date: Fri, 24 Jun 2011 11:09:56 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: Preventing JFFS2 partial page writes?
References: <4DF789FC.1030305@gmail.com>
	<1308722655.18119.40.camel@sauron>	<4E020A36.6070708@gmail.com>
	<20110622170747.GC25928@parrot.com>	<4E023FCD.9010800@gmail.com>
	<20110622200621.GA26973@parrot.com>
In-Reply-To: <20110622200621.GA26973@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/22/2011 04:06 PM, Ivan Djelic wrote:
> On Wed, Jun 22, 2011 at 08:17:33PM +0100, Peter Barada wrote:
>> On 06/22/2011 01:07 PM, Ivan Djelic wrote:
>>> On one hand it sure would be nice (and a bit complicated) to accurately
>>> describe OOB write constraints, for easier JFFS2/YAFFS2 integration.
>>> On the other hand, I am not sure such a complication is really worth the
>>> trouble, given that on next nand generation:
>>> - OOB areas will not be usable anymore for metadata storage (8-bit ecc leaves
>>>     only 6 spare bytes out of 64)
>>> - partial writes will probably be limited to 1 (like in MLC), meaning that
>>>     JFFS2 clean marking step will be forbidden anyway
>>> Furthermore, userspace will probably need to handle case 3) anyway (no
>>> protected oob bytes) to stay portable...
>>>
>> SLC parts (including this one) look to be around for a while, as well as
>> the products they are already in.  So I think the issue of JFFS2's
>> cleanmarker in the context of this Micron NAND needs to be solved,
>> preferably in a general way so the next oddball NAND chip that comes
>> along doesn't cause MTD, mtd-utils, JFFS2 (and other NAND FS) fits.
>>
>> Does UBIFS do any of the "partial writes" (i.e. write OOB/data area
>> multiple times) as JFFS2 does?
>
> No it doesn't. UBIFS relies on UBI, which itself does not rely on oob for
> storing metadata. BTW, have you considered using UBIFS instead of JFFS2/YAFFS2?
Yes.  However customers are already using JFFS2/YAFFS2 and are reluctant 
to change.
> --
> Ivan
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Peter Barada
peter.barada@gmail.com

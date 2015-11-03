Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtYgX-0001bE-0d
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 10:19:25 +0000
Date: Tue, 3 Nov 2015 11:18:57 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Michal Suchanek <hramrach@gmail.com>
CC: Richard Weinberger <richard@nod.at>, Tim Harvey <tharvey@gateworks.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
In-Reply-To: <CAOMqctQz=MnPMw2Dq-SFGwa1g7tPw7jG25Rh9=W4xkw-__HXDg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1511031114440.1465@lnxricardw1.se.axis.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAOMqctQz=MnPMw2Dq-SFGwa1g7tPw7jG25Rh9=W4xkw-__HXDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 3 Nov 2015, Michal Suchanek wrote:

> it has been pointed out that this assumption on the part of UBI that
> erased pages are composed of 0xff bytes is just wrong.
> 
> Here it is wrong in the sense that the pages are not bit-perfect but
> there are other reasons why it may go wrong.
> 
> - if the nand controller uses randomization layer the pages are 0xff
> bytes transformed by the randomization layer
> 
> - if MTD grows full-disk encryption then reading a page of 0xff bytes
> will yield what this page decrypts to using current encryption scheme
> 
> The layering is wrong here. The MTD core should provide a function to
> check if a physical page is empty and the driver should provide
> driver-specific implementation if needed.

In a sense, doesn't the driver already do that in that an erased page with 
bitflips should be corrected by ECC so that there are no bitflips 
apparent? If, as many hardware controllers do, the ECC check for an erased 
page fails, then the driver should still be able to determine that the 
page in question is erased, with bitflips, and should be able to provide a 
true 0xff page upward.

I agree though that an erased-page API function would be good too, as it 
moves the guesswork to the right place (the actual driver).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

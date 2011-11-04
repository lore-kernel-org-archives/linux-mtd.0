Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RMQTa-00020b-Vq
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2011 20:34:59 +0000
Message-ID: <4EB44C3F.5000000@newsguy.com>
Date: Fri, 04 Nov 2011 13:34:07 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320274859-3270-1-git-send-email-mikedunn@newsguy.com>
	<20111103085824.GA28465@parrot.com>
	<4EB25B62.4070502@parrot.com> <4EB3F4AA.8090703@newsguy.com>
	<20111104152352.GA17776@parrot.com>
	<20111104165824.GA18759@parrot.com>
In-Reply-To: <20111104165824.GA18759@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/04/2011 09:58 AM, Ivan Djelic wrote:
> On Fri, Nov 04, 2011 at 04:23:52PM +0100, Ivan Djelic wrote:
>> On Fri, Nov 04, 2011 at 02:20:26PM +0000, Mike Dunn wrote:
>>>
>>> Not entirely transparent.  I didn't think this through.  Modifying the
>>> hw-generated ecc bytes causes the hw to think that there were error(s) on every
>>> page.  True, the driver will know better, but it will slow things down because
>>> ordinarily the ecc unit only has to be read when the hardware reports errors. 
>>> With this scheme, an error is reported and the ecc bytes read and processed on
>>> every page.
> Oops, forget what I said in my previous post; I should have said the opposite:
> that is, my XOR masking idea only works if the controller does not compute
> recv_ecc^calc_ecc itself. So indeed you're right, it's not useful in your case.


OK makes sense again.  I was getting confused (though that's easy for me to
do).  Yeah, no error if hw calculates recv_ecc^calc_ecc == 0.  Should still
work, though, if I'm willing to take the performance hit of processing the
"error" and reading out hw ecc on every read.

Thanks again for the tips.  Matthieu also.

Mike

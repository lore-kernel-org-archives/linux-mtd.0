From: David Woodhouse <dwmw2@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <44644CE7.6060909@ru.mvista.com>
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<4461CC8C.6010105@ru.mvista.com>
	<f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>
	<44644CE7.6060909@ru.mvista.com>
Content-Type: text/plain
Date: Sat, 13 May 2006 15:08:13 +0100
Message-Id: <1147529294.8521.1.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russ Dill <russ.dill@gmail.com>, Josh Boyer <jwboyer@gmail.com>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-12 at 12:52 +0400, Vitaly Wool wrote:
> I'd rather go modifying mtdblock_ro. I don't want to implement FTL 
> because 1) as David pointed out, I don't need to handle writes; 2) I'm
> afraid we may end up dealing with patent issues here again. 

mtdblock_ro _is_ an FTL. Just a very very primitive one :)

By all means extend it until it does what we need -- but don't call it
mtdblock_ro.

-- 
dwmw2

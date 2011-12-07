Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=TX2EHSOBE007.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYL6g-0003Wq-9e
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 17:16:34 +0000
Message-ID: <4EDF9F6A.9000407@freescale.com>
Date: Wed, 7 Dec 2011 11:16:26 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Liu Shengzhou-B36685 <B36685@freescale.com>
Subject: Re: [PATCH 2/2 v2] mtd/nand: Add ONFI support for FSL NAND controller
References: <1323161655-19050-1-git-send-email-Shengzhou.Liu@freescale.com>
 <1323161655-19050-2-git-send-email-Shengzhou.Liu@freescale.com>
 <4EDE4E1D.4030408@freescale.com>
 <3F453DDFF675A64A89321A1F352810216B074A@039-SN1MPN1-005.039d.mgd.msft.net>
In-Reply-To: <3F453DDFF675A64A89321A1F352810216B074A@039-SN1MPN1-005.039d.mgd.msft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Wood Scott-B07421 <B07421@freescale.com>,
 Gala Kumar-B11780 <B11780@freescale.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/06/2011 09:16 PM, Liu Shengzhou-B36685 wrote:
>>> +			out_be32(&lbc->fbcr, 8);
>>> +			elbc_fcm_ctrl->read_bytes = 8;
>>> +		} else {
>>> +			out_be32(&lbc->fbcr, 256);
>>> +			elbc_fcm_ctrl->read_bytes = 256;
>>> +		}
>>
>> Any harm in always using 256?
>>
>> -Scott
> [Shengzhou] For NAND_CMD_READID command, the total bytes of entire ID string are 8, there are not 256 bytes so many, it's unnecessary and looks not so well logically to always using 256, though it works.

It's not performance critical, and always using 256 keeps things
simpler, and more robust if the length of the ID string grows in the
future (we used to assume it was 5 bytes...).

-Scott

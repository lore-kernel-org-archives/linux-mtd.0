Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2HhT-00028I-Df
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 08:46:52 +0000
Message-ID: <510F7577.7070300@freescale.com>
Date: Mon, 4 Feb 2013 16:46:47 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH v2 1/3] mtd: add new fields to nand_flash_dev{}
References: <1359007901-26464-1-git-send-email-b32955@freescale.com>	
 <1359007901-26464-2-git-send-email-b32955@freescale.com>	
 <5105DD0E.1010500@freescale.com>
 <1359967368.13791.22.camel@sauron.fi.intel.com>
In-Reply-To: <1359967368.13791.22.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, shmulik.ladkani@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8804=E6=97=A5 16:42, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Mon, 2013-01-28 at 10:06 +0800, Huang Shijie wrote:
>>> +     unsigned int id_len;
>>> +     unsigned long oobsize;
>>> +     unsigned long ecc_len;
>> I think it's better to submit another patch set to solve the ECC
>> problem.
> Would you please strip the cited text when bottom-posting - this would
> be a lot mailing-list-friendly.

ok. I will keep in mind about this.

thanks
Huang Shijie

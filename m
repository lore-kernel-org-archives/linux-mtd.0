Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPDk2-0006Kq-IQ
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 02:08:28 -0500
Message-ID: <442CD50A.6070006@intel.com>
Date: Fri, 31 Mar 2006 11:06:50 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
In-Reply-To: <1143733184.3579.47.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> Well, probably this is a perversion and is not needed in reality, but
> still. I conceive it like this. Yo have 2 flashes. You as usually,
> calculate the resulting eraseblock size. You see at the minimal I/O unit
> size of both flashes and similarly calculate the resulting minimal I/O
> size. So that's it. You'll end up with a though perverted, but still a
> striped MTD device.

First problem in case of striping NOR and NAND is a question about type 
of striped device. Should we report it as NOR or as NAND. I believe it 
is important for clients to know about that. Imagine, for example, 
device reported as NAND behaves as NOR or vice versa. Another problem is 
a difference in operation speed. Apparently you won't get any 
performance gain. These are only top of iceberg. Note that even plain 
and simple mtdconcat is not supposed to work with flashes of different 
types.

Alexander Belyakov

Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FOzFy-0004aG-Cy
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 10:40:54 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Alexander Belyakov <alexander.belyakov@intel.com>
In-Reply-To: <442BF839.8060402@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com>  <442BF839.8060402@intel.com>
Content-Type: text/plain
Date: Thu, 30 Mar 2006 19:39:44 +0400
Message-Id: <1143733184.3579.47.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-03-30 at 19:24 +0400, Alexander Belyakov wrote:
> Please explain how is it possible to stripe NOR device with NAND? And 
> what are you expecting from such an action?

Well, probably this is a perversion and is not needed in reality, but
still. I conceive it like this. Yo have 2 flashes. You as usually,
calculate the resulting eraseblock size. You see at the minimal I/O unit
size of both flashes and similarly calculate the resulting minimal I/O
size. So that's it. You'll end up with a though perverted, but still a
striped MTD device.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

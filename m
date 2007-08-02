Received: from mtagate8.de.ibm.com ([195.212.29.157])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGW8f-0000wh-WE
	for linux-mtd@lists.infradead.org; Thu, 02 Aug 2007 04:34:45 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id l728YO6O118422
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 08:34:24 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l728YOjP1757294
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 10:34:24 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l728YNgN009755
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 10:34:24 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org, dedekind@infradead.org
Subject: Re: [PATCH 1/5] ubi-utils: introduction of libubi_common
Date: Thu, 2 Aug 2007 10:33:59 +0200
References: <200707271723.38987.alexs@linux.vnet.ibm.com>
	<200707271728.48560.alexs@linux.vnet.ibm.com>
	<1185627090.26902.18.camel@sauron>
In-Reply-To: <1185627090.26902.18.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708021033.59483.alexs@linux.vnet.ibm.com>
Cc: Frank Haverkamp <haver@linux.vnet.ibm.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Saturday 28 July 2007, Artem Bityutskiy wrote:
> Is it possible to make any patterns like this part of _utilities_?
> UBI devices may have any names and it is defined by udev. The
> library should not assume any UBI device name.
> 
> Whole this file should be out of libubi,not part of it.

I think this issue is caused by the command line interface we have at
the moment, where only device numbers are specified and a path
to a custom device cannot be specified. So even if we move this
hardcoded path to the utils, the user is still not able to specify a
custom device path in _any_ of the utils.

What we have to do to resolve this issue IMO is to change the cli
(while preserving the old one for legacy), which is a more intrusive
change than migrating the tools to the new libubi, and which should
be a separate patch. However, even this change seems easier to me
when the device path is hardcoded only in one place...

Regards,
Alex

Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14T47f-0007Dn-00
	for mtd-list@infradead.org; Wed, 14 Feb 2001 15:45:39 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14T47e-0007Dh-00
	for mtd@infradead.org; Wed, 14 Feb 2001 15:45:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E6FE4E054F02D511818E00025558B61D429E1D@cluster01.axis.se> 
References: <E6FE4E054F02D511818E00025558B61D429E1D@cluster01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 14 Feb 2001 15:45:03 +0000
Message-ID: <23315.982165503@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jonas.holmberg@axis.com said:
> +	if (!bootloc) { 
> +		if (cfi->id & 0x80) {


If possible, we should be checking the version number of the query table,
and using bootloc if the version number is equal to or greater than the
version at which the bootloc field was defined. If it's undefined, it
doesn't have to be zero. 

I'd like to keep this kludge wrapped in an ifdef just to make sure it's 
easy to disable it if necessary. It can be left on by default.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

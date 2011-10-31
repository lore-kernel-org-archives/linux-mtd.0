Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKvjQ-000693-3U
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 17:33:08 +0000
Received: from [192.168.12.102] (133.sub-166-250-2.myvzw.com [166.250.2.133])
	by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id p9VHX4ZP098923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2011 10:33:05 -0700 (PDT)
	(envelope-from mikedunn@newsguy.com)
Message-ID: <4EAEDBA3.6050005@newsguy.com>
Date: Mon, 31 Oct 2011 10:32:19 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 05/13] mtd/docg3: add multiple floor support
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
	<1319824292-11085-6-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1319824292-11085-6-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/28/2011 10:51 AM, Robert Jarzmik wrote:
> Add support for multiple floors, ie. cascaded docg3
> chips. There might be 4 docg3 chips cascaded, sharing the
> same address space, and providing up to 4 times the storage
> capacity of a unique chip.
>
> Each floor will be seen as an independant mtd device.
>

Do we know of any products that contain multiple doc devices in a cascaded
configuration? 

Thanks,
Mike

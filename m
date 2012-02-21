Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=VA3EHSOBE008.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RzhR9-0000Vb-UW
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2012 04:34:48 +0000
Message-ID: <4F431F63.1020805@freescale.com>
Date: Tue, 21 Feb 2012 12:36:51 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: use the full-id string as the keyword to search
 the id table
References: <1329476273-14381-1-git-send-email-b32955@freescale.com>
 <CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>
In-Reply-To: <CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Brian:
> And I didn't check too closely, but I think HY27UT088G2M (and maybe
> HY27UW08CGFM?) should be supported by the ID decoding and don't need
> new table entries.
I recheck the datasheets of HY27UT088G2M/HY27U208CGFM, the chipsize can 
be culculated by parsing the ID data.
the new table entries are not needed.

BR
Huang Shijie

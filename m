Received: from ns3a.townisp.com ([216.195.0.136] helo=ns3.townisp.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6ccK-0002oL-0x
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 17:46:56 -0500
Received: from gemini.home.net (dhcp-0-10-57-0-7-57.cpe.townisp.com
	[64.30.95.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by ns3.townisp.com (Postfix) with ESMTP id 4F99829930
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Mar 2005 17:46:55 -0500 (EST)
Date: Wed, 2 Mar 2005 17:46:56 -0500 (EST)
From: Jamie Guinan <guinan@bluebutton.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.60.0503021658180.25807@gemini.home.net>
Message-ID: <Pine.LNX.4.60.0503021746030.26017@gemini.home.net>
References: <Pine.LNX.4.60.0503021658180.25807@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Re: [PATCH] Add SST 39VF1601
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Mar 2005, Jamie Guinan wrote:

> 
> Patch against 2.6.11.  The "x8" bothers me since its a 16bit-only chip, 
> but it breaks without it (various other chips seem to do similar).

Nevermind, I just noticed that its in the latest mtd snapshot.

-Jamie

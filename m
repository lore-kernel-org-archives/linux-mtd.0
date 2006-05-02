Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FauQk-00005s-Ip
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 08:56:52 -0400
Message-ID: <44575705.7030104@arcom.com>
Date: Tue, 02 May 2006 13:56:37 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: dsaxena@plexity.net
References: <20060502085045.GA15204@plexity.net>
In-Reply-To: <20060502085045.GA15204@plexity.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: RedBoot partition not @ end of flash...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Deepak Saxena wrote:
> I've got a board with a 32MiB flash (128K SectorSize) with the redboot table
> only covering the first (32MiB - SectorSize) and the rest setup as OTP from
> what I understand. What is the proper way to deal with this? What I'm doing 
> right now is a heinous hack:

'redboot.directory=-2' command line option?

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/

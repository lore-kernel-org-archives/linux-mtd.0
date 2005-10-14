Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQZla-00050k-Hi
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2005 20:19:32 -0400
Received: from 202-154-141-161-tollfree.connections.net.nz
	(202-154-141-161-tollfree.connections.net.nz [202.154.141.161])
	by desire.actrix.co.nz (Postfix) with ESMTP id CF0C8153C3
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 14:20:04 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Fri, 14 Oct 2005 14:26:08 +1300
References: <200510051100.53425.manningc2@actrix.gen.nz>
In-Reply-To: <200510051100.53425.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510141426.08404.manningc2@actrix.gen.nz>
Subject: Re: Simulating 2k page devices with nandsim
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi mtders.


On Wednesday 05 October 2005 11:00, Charles Manning wrote:
> Hi folks
>
> I have used nandsim to do yaffs testing using nandsim to simulate 512-byte
> page devices. No problems. Basic procedure outlined in
> http://www.aleph1.co.uk/pipermail/yaffs/2005q3/001356.html
>
> Is there a quick howto on using nandsim to simulate 2k page devices? I
> would like to test the 2k page support using nandsim rather than hardware.
>
> I know there is a memory allocation limitation with nandsim that prevents
> simulation of huge devices, but I would be happy simulating, say, a 16MB
> device with 2k pages.
>
> Thanx
>
> -- CHarles

Can anybody tell me how to emulate a 2k page device on nandsim? 

Has anyone tried this?

Thanx

-- CHarles

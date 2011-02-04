Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PlKtF-0001Jc-GV
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 12:35:54 +0000
In-Reply-To: <OFD03FCD17.DAB1BF0D-ONC125782D.0044023C-C125782D.004452F0@transmode.se>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>				<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>	<4D4AD9ED.8060104@keymile.com>
	<4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	<4D4BDD48.6040600@keymile.com>
	<OFD03FCD17.DAB1BF0D-ONC125782D.0044023C-C125782D.004452F0@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
Message-ID: <OFB9117394.9B77C4E6-ONC125782D.0044F21F-C125782D.00453314@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 4 Feb 2011 13:35:50 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	stefan.bigler@keymile.com, Michael Cashwell <mboards@prograde.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Stefan Bigler <stefan.bigler@keymile.com> wrote on 2011/02/04 12:04:40:
> >
> > Hi Jocke
> >
> > The code does the same, but is much nicer :-)
> > My test is also working again.
>
> Thinking a little more one could do:
> if (chip->state == chip_state) {
>    status = map_read(map, cmd_adr);
>       if (map_word_andequal(map, status, status_OK, status_OK))
>          break;
> }

This is a bit unoptimal too:
#define XIP_INVAL_CACHED_RANGE(x...)
#define INVAL_CACHE_AND_WAIT inval_cache_and_wait_for_operation

....

	mutex_unlock(&chip->mutex);
	if (inval_len)
		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
	mutex_lock(&chip->mutex);

XIP_INVAL_CACHED_RANGE is always a nop but still we drop and take the lock.
Just a waste of CPU.

 Jocke

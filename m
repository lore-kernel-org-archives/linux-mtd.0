Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EPKPX-0001pm-CA
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2005 09:44:25 -0400
Message-ID: <434BC175.1050204@ieee.org>
Date: Tue, 11 Oct 2005 09:43:17 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
References: <434AA136.376.1BAE532@localhost>
In-Reply-To: <434AA136.376.1BAE532@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: docboot: requirements for build?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joseph M Dupre (AVAB Inc.) wrote:
> Is it necessary to 'make' the docboot doc_spl image on the target 
> system itself?

Nope, shouldn't be a problem.  I always build doc_spl on a different system.

	-Dan

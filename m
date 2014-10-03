Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa4wT-0003hc-KJ
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 15:38:50 +0000
Message-ID: <1412350705.3795.105.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 1/5] mtd: ubi: Read disturb infrastructure
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 03 Oct 2014 18:38:25 +0300
In-Reply-To: <542D5BC0.5040207@nod.at>
References: <1411886220-8208-1-git-send-email-tlinder@codeaurora.org>
 <5427C45C.2080506@nod.at> <5427CB6E.7010007@codeaurora.org>
 <5427CCD8.2090605@nod.at> <5427E6FE.3090906@codeaurora.org>
 <5427E8CA.8000904@nod.at> <542D49FD.7040204@codeaurora.org>
 <542D5203.2080601@nod.at> <542D5657.3060208@codeaurora.org>
 <542D5BC0.5040207@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dedeking1@gmail.com,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-10-02 at 16:05 +0200, Richard Weinberger wrote:
> The question is, do we really need all this values on-flash?

Good question, this is why I requested some kind of design description,
which would clearly explain the problem.

Just off-the top of my head, may be it could be enough to keep the
counters only in the UBI headers, may be it is enough to work with some
kind of averages. But it is hard to tell without clearly understanding
the problem we are solving.

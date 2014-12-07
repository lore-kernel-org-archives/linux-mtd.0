Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxcAv-0000uk-UD
 for linux-mtd@lists.infradead.org; Sun, 07 Dec 2014 13:47:03 +0000
Message-ID: <54845A3B.6020607@nod.at>
Date: Sun, 07 Dec 2014 14:46:35 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [PATCH 1/6] UBI: Fastmap: Fix memory leaks while closing the
 WL sub-system
References: <1417347340-6872-1-git-send-email-richard@nod.at>
 <1417347340-6872-2-git-send-email-richard@nod.at>
 <54840C44.4090406@codeaurora.org> <548423E3.8010106@nod.at>
 <54843AE2.6070608@codeaurora.org> <54843B48.6020701@nod.at>
 <5484559D.8070407@codeaurora.org>
In-Reply-To: <5484559D.8070407@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.12.2014 um 14:26 schrieb Tanya Brokhman:
> you're right, found it at ubi_detach_mtd_dev() several lines after calling ubi_wl_close(). But if you're creating a fastmap-close dedicated function, fm_buf should be freed in it
> as it is fastmap related.

The idea was to have WL related stuff in this function.
But I can add more into it in a subsequent patch.

Thanks,
//richard

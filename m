Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d41vK-0001EM-BG
 for linux-mtd@lists.infradead.org; Fri, 28 Apr 2017 09:10:52 +0000
Subject: Re: [PATCH 4/6] ubifs: Maintain a parent pointer
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1480629741-18375-1-git-send-email-richard@nod.at>
 <1480629741-18375-5-git-send-email-richard@nod.at>
 <20170428083152.GA7984@sebu>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <3e3b3c06-2a2f-41f8-c723-3e7c456c9e98@nod.at>
Date: Fri, 28 Apr 2017 11:09:21 +0200
MIME-Version: 1.0
In-Reply-To: <20170428083152.GA7984@sebu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hyunchul,

Am 28.04.2017 um 10:31 schrieb Hyunchul Lee:
> I guess that dir->i_ino should be assigned to ui->parent_inum.

Uff, right.
It is obvious that I did this series in a hurry. :D

Thanks,
//richard

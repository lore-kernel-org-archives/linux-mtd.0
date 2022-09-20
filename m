Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F41EECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 05:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvtcNghJLDuNDj77JPPCt8z064mJ2DQS6RAhEneQfWo=; b=eRAQlsEvAUnFh4
	27sufCT6HP3GKzuagb8zVwxvbEXVn8sMPtbLSeOLTyJT72i+6z8xte3vAEwSL7diC+XLLB4QhCb3n
	uZKTxobincVkefvz8hTOHJGO+W8nNCcfUenaz/hXZZ2RAzy8cffoAmxzKshQ5gWDB54yC+baolywY
	aoC4chPzM3x9bVwK8cNkKQg/XC8b2ly7waklpETS+aCbPQ1jRsy4dXRMgIcHV3x5rgxrJibsmIBwq
	KJmph0qXF3ORH3T9YEge5/68fPvqdoYKaH6oq1N9q7c3ymqk0v2j0CPkN5V62wmCt2I4MGctRTEMS
	R/gKKE3x1lP/YEYh8izQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaVkt-000fiG-Kg; Tue, 20 Sep 2022 05:25:11 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaVko-000fee-Ro
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 05:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663651506; x=1695187506;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xuDq04V3ERIqON4UuLH1RmjGkFR75KWm8lnYzEvFeDI=;
  b=PEB4v+TMmYb90qPSc1SynTym9s+3N2RBZxanbVMkdkyT7wseQgAC6JLC
   Te/AMpkIcXeKn97Y2KX2tTVBr8MBXKC9XAJQ6SyzCDoHAhr9PpzZmx1xF
   knzYtdZ2eFYLz71WumxAp/CTbaWiX41v71lJJJHmGkrQ4/kwHuXvWgtI6
   ZA9vBDxtBJgPISpF9FAZS2IGM4nHxs075X61990pxoh0/+k0TWGzSMMJP
   +HZQgGLX/SC168tcRQtzinRlD+i3xNPsAWm4ChPltXZuqNTOMTINvIX+j
   2qpPurq6t6i1Tw+LdyzCCue9iKyo4dq41sQSNJbvFpArFkk2TZOWfeY1b
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299590086"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="299590086"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 22:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="794124954"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 19 Sep 2022 22:25:01 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com [10.252.59.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id C58B4580713;
	Mon, 19 Sep 2022 22:24:56 -0700 (PDT)
Date: Tue, 20 Sep 2022 07:24:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@linux.ie>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Message-ID: <20220920072454.4cf91f24@maurocar-mobl2>
In-Reply-To: <Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
References: <cover.1652113087.git.mchehab@kernel.org>
	<Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_222506_932541_3ECBF53F 
X-CRM114-Status: GOOD (  20.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Luis,

On Mon, 9 May 2022 13:38:28 -0700
Luis Chamberlain <mcgrof@kernel.org> wrote:

> On Mon, May 09, 2022 at 06:23:35PM +0200, Mauro Carvalho Chehab wrote:
> > Currently, kernel/module annotates module dependencies when
> > request_symbol is used, but it doesn't cover more complex inter-driver
> > dependencies that are subsystem and/or driver-specific.
> >   
> 
> At this pount v5.18-rc7 is out and so it is too late to soak this
> in for the proper level of testing I'd like to see for modules-next.
> So I can review this after the next merge window. I'd want to beat
> the hell out of this and if possible I'd like to see if we can have
> some test coverage for the intended goal and how to break it.

Any news with regards to this patch series?

Regards,
Mauro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

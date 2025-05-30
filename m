Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66FC5B543
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIpNoxgX3ww6mFA4G7Bd8x6d15NhMen5pU9RkYruwYY=; b=UrGeZw+m7tHNeJ
	CTDt8GAT2c8luOqxI3ZCW5OKY7LIKNaXDh2jVV39JwhOIskd76ekm2/nEAjhADkrP0JhgcfZ+8Afx
	k4u6wrN59YggYrMy+66rrtPKY8JMHhpo0a388G6g43IAVFsOxH2lLEEcBODg6imw+6RdtZ5crGldy
	trVg96PJQoGO61fAJFdwVTTHWuLl3MIBSR9YpDTdFEwr6xJ51UcMfaJIThus/69AagWZ+aDPzwsxD
	Er/dzfTc1OlyObXvBYxIWMzmTJz0Ulxp6YQTD5z0FeI0j4TWAdpGlcg8RZz/MbQlV69aXkfe34woP
	6eai5ZkMZx3KN0sj0U7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL09A-00000000oV1-0zQz;
	Fri, 30 May 2025 13:51:44 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL097-00000000oSs-30mP
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 13:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613101; x=1780149101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pX2PTHtPzqLQ5kA1NmW2FjwzP4CXJktF96ar71uadBI=;
  b=Q090HTMVZB+loPdMDQPakXXjZzETaLJ1vdWa06daDHCpI1QZ/HR+B0/v
   WoDyvinXlQb7uvraZGekKvCb5IYdMVyHnYxNF1WsXsJZkKhpljn1Y1kAk
   nXA1/P3YaWgVydchl5tK/dxdw5lar2cVUL4Uza8EBEEsh5+sopfup9ZYN
   NM7GFBQQuuVAXAUtVPQdKS6yAYzIIuEm+zaxR9SnWfTLRri/DcuMo+a/4
   Bnjk8/o+lL3yFYY/n7xtC+rE/qBjN2m/31hnj7+dAam8PPdH4LlU3lB7i
   k3hKcXv8v1hxC/Z6UhhUTkLOxO/Z3rTYCkNkVfjOshbH8hiEzXmqSwWeG
   w==;
X-CSE-ConnectionGUID: QQHX0xjmRM6BCZ6WmI3AsQ==
X-CSE-MsgGUID: dsI9pwiwT/SiKImFMtBMlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50402017"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50402017"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:51:39 -0700
X-CSE-ConnectionGUID: ZJN+7x+rQCm/0h/vPOARow==
X-CSE-MsgGUID: P+15Gi7KSJGyJHH3fdtplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143850083"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:51:34 -0700
Date: Fri, 30 May 2025 16:51:30 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Tomas Winkler <tomasw@gmail.com>,
	Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v11 04/10] mtd: intel-dg: register with mtd
Message-ID: <aDm34rQxtYhvt6fc@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-5-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-5-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_065141_800489_2D61310C 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 28, 2025 at 04:51:09PM +0300, Alexander Usyskin wrote:
> Register the on-die nvm device with the mtd subsystem.
> Refcount nvm object on _get and _put mtd callbacks.
> For erase operation address and size should be 4K aligned.
> For write operation address and size has to be 4bytes aligned.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

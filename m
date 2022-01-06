Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE90C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 01:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fvtkch5MKqQcTeNsqm85B49R4GIC+XM6z/6FnwC4G10=; b=B0rLhowDlO7wu2
	thqqaag1cfTn3UgxnbgjsiIs2hE1J8MlMSRBD6g+BbpZMppmNuRlHdp2aZLtnkU258lols4iyimUj
	lIz84JLjzJfgENjc1ybvO5uMWUwMHwdjjG5DeNwVXdjJSkvPGijnnaubE/5dogZmFSCIDeUsA4PUA
	cHd4LtfaQdgNc5PKlyQ0z58QkZnk2zgxmJH7Lg0EXPdSqToltga+glyQPo5Fymeb3ll1NhIsrzPGp
	JxyTXiOcf1Op8AZ1Incy0OLmOgfBnk+6nLr+nmRmapzw3RtktqY+Zj4kJnNYzSS13OEyphTKt/1zX
	/1UDym2WPcPTBkJYAUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5HK9-00G7Zn-Vv; Thu, 06 Jan 2022 01:12:14 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5HK3-00G7ZN-Pr
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 01:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641431527; x=1672967527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a9cgR3ZklLRLXSGatWcixupy5U4iqX77Qg420ljyNvY=;
 b=ZFQSqxBh1FrEduXYQXfMQv3AH1aobk7AAbLhMS4UeiNh1rYlIE2wtdCN
 m5epXzdtb3v2iXK2+FDJ4mVvRBvTT4lKZBqPbVi9XHmeB7LZnE/81gFWq
 +6H5w56zFyGBN65sdkPQhZHvkiFLP/jkMiZq6TOLqKpn52Tz8ajPWzGBD
 qLSSaGOWEYdex/Xw17I+Qemtcr5wXRNuhI0bgWvxnQ1XDlbTLMmSmsIbB
 7UXfxU+/yxazayfsS8YmUNsBLXyp0zwLQKs/2axRraKIl7aZSKwCvujA6
 xUsDPWfEc1je+Yr1nHLF6MVU/FVbCGrp07iTSjTGG1X8BGM+iyddAScGp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229380485"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; d="scan'208";a="229380485"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 17:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; d="scan'208";a="668287898"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2022 17:12:01 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n5HJw-000HCW-VW; Thu, 06 Jan 2022 01:12:00 +0000
Date: Thu, 6 Jan 2022 09:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/5] nvmem: core: Remove unused devm_nvmem_unregister()
Message-ID: <202201060932.tcQFIVfQ-lkp@intel.com>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_171207_929726_0940F03D 
X-CRM114-Status: GOOD (  16.56  )
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

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes char-misc/char-misc-testing linus/master v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/nvmem-core-Remove-unused-devm_nvmem_unregister/20220104-213933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
config: mips-randconfig-r002-20220105 (https://download.01.org/0day-ci/archive/20220106/202201060932.tcQFIVfQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/7877de3d47433a75d2beea38b696b3c4fde62082
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/nvmem-core-Remove-unused-devm_nvmem_unregister/20220104-213933
        git checkout 7877de3d47433a75d2beea38b696b3c4fde62082
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/nvmem/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvmem/core.c:946:12: warning: unused function 'devm_nvmem_match'
   static int devm_nvmem_match(struct device void void
   ^
   fatal error: error in backend: Nested variants found in inline asm string: ' .set push
   .set mips64r2
   .if ( 0x00 ) != -1)) 0x00 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/atomic.h", .line = 157, $); 0x00 ) != -1)) : $))) ) && ( 0 ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $1, $2 # atomic_fetch_sub
   subu $0, $1, $3
   sc $0, $2
   beqz $0, 1b
   .set pop
   move $0, $1
   '
   PLEASE submit a bug report to https://bugs.llvm.org/ and include the crash backtrace, preprocessed source, and associated run script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/nvmem/.core.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler-version.h -include include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=0xffffffff84000000 -DLINKER_LOAD_ADDRESS=0x84000000 -DDATAOFFSET=0 -Qunused-arguments -fmacro-prefix-map== -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 --target=mipsel-linux -fintegrated-as -Werror=unknown-warning-option -Werror=ignored-optimization-argument -mno-check-zero-division -mabi=32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=mips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-au1x00 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-member -O2 -Wframe-larger-than=1024 -fno-stack-protector -Wimplicit-fallthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable -Wno-unused-const-variable -ftrivial-auto-var-init=pattern -fno-stack-clash-protection -pg -falign-functions=64 -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=date-time -Werror=incompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-limits -fsanitize=array-bounds -fsanitize=unreachable -fsanitize=object-size -fsanitize=enum -fsanitize-coverage=trace-pc -I drivers/nvmem -I ./drivers/nvmem -ffunction-sections -fdata-sections -DKBUILD_MODFILE="drivers/nvmem/nvmem_core" -DKBUILD_BASENAME="core" -DKBUILD_MODNAME="nvmem_core" -D__KBUILD_MODNAME=kmod_nvmem_core -c -o drivers/nvmem/core.o drivers/nvmem/core.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/nvmem/core.c'.
   4. Running pass 'Mips Assembly Printer' on function '@kref_put'
   #0 0x000055c30463cb3f Signals.cpp:0:0
   #1 0x000055c30463aa8c llvm::sys::CleanupOnSignal(unsigned long) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3401a8c)
   #2 0x000055c30457e667 llvm::CrashRecoveryContext::HandleExit(int) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3345667)
   #3 0x000055c30463313e llvm::sys::Process::Exit(int, bool) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x33fa13e)
   #4 0x000055c3022b933b (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x108033b)
   #5 0x000055c30458510c llvm::report_fatal_error(llvm::Twine const&, bool) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x334c10c)
   #6 0x000055c3052679b8 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr const (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x402e9b8)
   #7 0x000055c305263759 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x402a759)
   #8 0x000055c302d1482e llvm::MipsAsmPrinter::runOnMachineFunction(llvm::MachineFunction&) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x1adb82e)
   #9 0x000055c3039ab2fd llvm::MachineFunctionPass::runOnFunction(llvm::Function&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055c303de3867 llvm::FPPassManager::runOnFunction(llvm::Function&) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x2baa867)
   #11 0x000055c303de39e1 llvm::FPPassManager::runOnModule(llvm::Module&) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x2baa9e1)
   #12 0x000055c303de4cbf llvm::legacy::PassManagerImpl::run(llvm::Module&) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x2babcbf)
   #13 0x000055c30494e4fa clang::EmitBackendOutput(clang::DiagnosticsEngine&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream> >) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x37154fa)
   #14 0x000055c30557bea3 clang::BackendConsumer::HandleTranslationUnit(clang::ASTContext&) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x4342ea3)
   #15 0x000055c30607ffd9 clang::ParseAST(clang::Sema&, bool, bool) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x4e46fd9)
   #16 0x000055c30557acff clang::CodeGenAction::ExecuteAction() (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x4341cff)
   #17 0x000055c304f7a001 clang::FrontendAction::Execute() (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3d41001)
   #18 0x000055c304f11bda clang::CompilerInstance::ExecuteAction(clang::FrontendAction&) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3cd8bda)
   #19 0x000055c30504307b (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3e0a07b)
   #20 0x000055c3022ba084 cc1_main(llvm::ArrayRef<char char (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x1081084)
   #21 0x000055c3022b75cb ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.cpp:0:0
   #22 0x000055c304daeb15 void llvm::function_ref<void ()>::callback_fn<clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055c30457e523 llvm::CrashRecoveryContext::RunSafely(llvm::function_ref<void ()>) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3345523)
   #24 0x000055c304daf40e clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055c304d85ee7 clang::driver::Compilation::ExecuteCommand(clang::driver::Command const&, clang::driver::Command const (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3b4cee7)
   #26 0x000055c304d868c7 clang::driver::Compilation::ExecuteJobs(clang::driver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Command >&) const (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3b4d8c7)
   #27 0x000055c304d90139 clang::driver::Driver::ExecuteCompilation(clang::driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Command >&) (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x3b57139)
   #28 0x000055c3021e219f main (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0xfa919f)
   #29 0x00007fcd1a9e4d0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x26d0a)
   #30 0x000055c3022b70ea _start (/opt/cross/clang-d5b6e30ed3/bin/clang-14+0x107e0ea)
   clang-14: error: clang frontend command failed with exit code 70 (use -v to see invocation)
   clang version 14.0.0 (git://gitmirror/llvm_project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-d5b6e30ed3/bin
   clang-14: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts security source usr


vim +/devm_nvmem_match +946 drivers/nvmem/core.c

f1f50eca5f9052 Andrey Smirnov 2018-03-09  945  
f1f50eca5f9052 Andrey Smirnov 2018-03-09 @946  static int devm_nvmem_match(struct device *dev, void *res, void *data)
f1f50eca5f9052 Andrey Smirnov 2018-03-09  947  {
f1f50eca5f9052 Andrey Smirnov 2018-03-09  948  	struct nvmem_device **r = res;
f1f50eca5f9052 Andrey Smirnov 2018-03-09  949  
f1f50eca5f9052 Andrey Smirnov 2018-03-09  950  	return *r == data;
f1f50eca5f9052 Andrey Smirnov 2018-03-09  951  }
f1f50eca5f9052 Andrey Smirnov 2018-03-09  952  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
